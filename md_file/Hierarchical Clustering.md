R 中 hclust 可以使用 Hierarchical Clustering 畫 denodiagram
畫 heat map 時也可以用 Hierarchical Clustering 讓圖更好看

以下說明摘自[StatQuest: Hierarchical Clustering](https://www.youtube.com/watch?v=7xHsRkOdVwo&ab_channel=StatQuestwithJoshStarmer)

### heat map and Hierarchical Clustering
![[Pasted image 20220428132943.png]]
![[Pasted image 20220428132953.png]]


### how to do Hierarchical Cluste
#### construct Hierarchical Cluste
1. 兩兩比較各基因(通常會是 row)，將最相似的連結成一個 cluster，接下來這個由兩個基因組成的cluster會被當成同一個東西既須跟其他人比較(值怎麼取我不知道，可能是平均或其他東西 -> details會說)
2. 在去比較下一個最相似的兩個基因或 cluster，連成一個 cluster，依此類推

![[Pasted image 20220428143141.png]]
![[Pasted image 20220428143211.png]]

#### details
##### 如何比較基因表現之間的 similarity 
1. Euclidian distance, most used $\sqrt{\displaystyle\sum_{i = 1}^k (difference\ in\ sample\ i)^2}$
	![[Pasted image 20220428143445.png]]
2. Manhattan distance
3. many other
自己判斷該用拿個，沒有一定的標準 QQ

##### 如何比較單一基因跟 cluster 的距離
我們已經有數個 cluster，要決定某個基因屬於哪個 cluster 時，可以用
- average of each cluster
- closest point in each cluster 
- furthest point in each cluster (default setting in R)
- other




