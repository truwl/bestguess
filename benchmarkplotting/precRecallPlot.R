#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
#Rscript precRecallPlot.R foo truwlbenchmarks.txt data.csv bar.png

# test if there is at least one argument: if not, return an error
if (length(args)<4) {
  stop("Need sample name, sample metrics, static competitor benchmarks csv, and output plot filename", call.=FALSE)
}

library(ggplot2)
library(dplyr)
library(plotly)
library(RColorBrewer)

samplename <- args[1] 
metrics <- args[2] #generally truwlbenchmarks.txt
competitors <- args[3] #some static metrics csv
plotname <- args[4] #png name

read.table(metrics,header=TRUE) %>%
  dplyr::mutate(variable=stringr::str_replace(string=variable,pattern='METRIC.Recall',replacement='Recall')) %>%
  dplyr::mutate(variable=stringr::str_replace(string=variable,pattern='METRIC.Precision',replacement='Precision')) %>%
  dplyr::filter(variable=='Precision' | variable=='Recall') %>%
  dplyr::rename(metric=variable) %>%
  dplyr::select(Region,Type,Filter,metric,value) -> bench

bench$Sample<-samplename

read.csv(competitors) %>% 
  dplyr::select(GermlineVariantCallBenchmark.queryVCF,Region,Type,Filter,METRIC.Precision,METRIC.Recall) %>% 
  dplyr::rename(Sample=GermlineVariantCallBenchmark.queryVCF,Precision=METRIC.Precision,Recall=METRIC.Recall) %>% 
  dplyr::mutate(Sample=stringr::str_replace(string=Sample,pattern='gs://benchmarking-datasets/',replacement='')) %>%
  dplyr::mutate(Sample=stringr::str_replace(string=Sample,pattern='.vcf(.gz)?',replacement='')) %>%
  reshape2::melt() %>%
  dplyr::rename(metric=variable) -> melted

all<-rbind(melted,bench)
p<-ggplot(all)+geom_bar(aes(group=Sample,x=value,y=metric,fill=Sample),stat="identity",position = "dodge")+facet_wrap(~Type+Filter+Region)+scale_fill_brewer(palette="Paired")

ggsave(plot=p,filename=plotname,device="png")