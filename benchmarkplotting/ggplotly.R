library(ggplot2)
library(dplyr)
library(plotly)
library(wesanderson)

read.csv("data.csv") %>% 
  dplyr::select(GermlineVariantCallBenchmark.queryVCF,METRIC.Precision,METRIC.Recall) %>% 
  dplyr::rename(Sample=GermlineVariantCallBenchmark.queryVCF,Precision=METRIC.Precision,Recall=METRIC.Recall) %>% 
  dplyr::mutate(Sample=stringr::str_replace(string=Sample,pattern='gs://benchmarking-datasets/',replacement='')) %>%
  dplyr::mutate(Sample=stringr::str_replace(string=Sample,pattern='.vcf(.gz)?',replacement='')) %>%
  reshape2::melt() %>%
  dplyr::rename(metric=variable) -> melted

p<-ggplot(melted)+geom_bar(aes(group=Sample,x=value,y=metric,fill=Sample),stat="identity",position = "dodge")

p<-p+scale_fill_manual(values=wes_palette(n=8, name="GrandBudapest1", type = "continuous"))

ggplotly(p)