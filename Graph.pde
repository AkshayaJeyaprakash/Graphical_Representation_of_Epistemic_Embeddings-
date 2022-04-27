class Graph{
  int[][] adjacency_matrix;
  int n_nodes;
  ArrayList<Node> nodes;
  boolean adj;
  Crawler crawler;
  
  Graph(int[][] adjmatrix){
    this.n_nodes = adjmatrix[0].length;
    this.adjacency_matrix = adjmatrix;
    nodes = new ArrayList<Node>();
    adj =true;
    
    for(int i=0;i<this.n_nodes;i++){
      Vec2D center = new Vec2D(width/2,height/2);
      Vec2D offsetvec = center.add(Vec2D.randomVector());
      Node temp = new Node(offsetvec.x,offsetvec.y);
      nodes.add(temp);
      physics.addParticle((Node) nodes.get(i));
    }
    this.connect();
  }
  
  Graph()throws IOException{
    this.n_nodes =0;
    this.adjacency_matrix=null;
    nodes = new ArrayList<Node>();
    adj =false;
    crawler = new Crawler();
  }
  
  void addNode(){
    Vec2D center = new Vec2D(width/2,height/2);
    Vec2D offsetvec = center.add(Vec2D.randomVector());
    Node temp = new Node(offsetvec.x,offsetvec.y);
    this.nodes.add(temp);
    this.n_nodes +=1;
    physics.addParticle((Node) nodes.get(this.n_nodes-1));
  }

  Node addNode(String url) throws IOException{
    Vec2D center = new Vec2D(width/2,height/2);
    Vec2D offsetvec = center.add(Vec2D.randomVector());
    ArrayList<String> urls = this.crawler.crawl(url);
    Node temp = new Node(offsetvec.x,offsetvec.y,url,urls);
    this.nodes.add(temp);
    this.n_nodes +=1;
    physics.addParticle((Node) nodes.get(this.n_nodes-1));
    return temp;
  }

  void addEdge(Node a,Node b){
    a.connected_nodes.add(b);
    b.connected_nodes.add(a);
    physics.addSpring(new VerletSpring2D(a,b,60,0.0009));
  }

  void addEdge(int x,int y){
    Node a = (Node) this.nodes.get(x);
    Node b = (Node) this.nodes.get(y);
    a.connected_nodes.add(b);
    b.connected_nodes.add(a);
    physics.addSpring(new VerletSpring2D(a,b,60,0.0009));
  }
  
  void connect(){
    for(int row=0;row<this.adjacency_matrix.length-1;row++){
      for(int col=0;col<this.adjacency_matrix[0].length;col++){
        if(row<col){
          if(this.adjacency_matrix[row][col]==1){
            physics.addSpring(new VerletSpring2D((Node) this.nodes.get(row),(Node)this.nodes.get(col),60,0.0009));
          }
        }
      }
    }
  }
  
  Node findNode(String url){
    for(Node node:this.nodes){
      if(url.equals(node.url)){
        return node;
      } 
    }
  }
  
  void show(){
    stroke(255);
    fill(255,150);
    for(Node node :this.nodes){
      node.show();
    }
    if(adj){
      for(int row=0;row<this.adjacency_matrix.length-1;row++){
        for(int col=0;col<this.adjacency_matrix[0].length;col++){
          if(row<col){
            if(this.adjacency_matrix[row][col]==1){
              Node n1 = (Node) this.nodes.get(row);
              Node n2 = (Node) this.nodes.get(col);
              stroke(225,180);
              line(n1.x,n1.y,n2.x,n2.y);
            }
          }
        }
      }
    }
    else {
      for(Node node : this.nodes){
        for(Node connected_node:node.connected_nodes){
          stroke(225,180);
          line(node.x,node.y,connected_node.x,connected_node.y);
        }
      }
    }
  }
}
