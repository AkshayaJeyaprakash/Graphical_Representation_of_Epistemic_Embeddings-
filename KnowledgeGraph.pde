class KnowledgeGraph {
  String url;
  ArrayList<String> nodes_url;
  int depth;
  Graph g;
  
  KnowledgeGraph(String url,int depth) throws IOException{
    this.url=url;
    this.depth=depth;
    nodes_url = new ArrayList<String>();
    g = new Graph();
    Node temp = g.addNode(url);
    this.discover(temp);
  }
  
  void discover(Node rootnode) throws IOException{
    for(String url :rootnode.urls){
      System.out.println(url);
      if(this.nodes_url.contains(url)){
        g.addEdge(rootnode,g.findNode(url));
      }
      else{
        g.addNode(url);
        nodes_url.add(url);
        g.addEdge(rootnode,g.findNode(url));
      }
    }
  }
  
  void show(){
    g.show();
  }
}
