import toxi.physics2d.behaviors.*;

class Node extends VerletParticle2D{
  ArrayList<String> urls;
  String url;
  ArrayList<Node> connected_nodes;
  color highlight_colour;
  color colour;
  
  Node(){
    super(0,0);
  }
  
  Node(float x,float y,String url,ArrayList<String> urls){
    super(x,y);
    physics.addBehavior(new AttractionBehavior2D(this, 90, -0.8));
    colour=color(255);
    highlight_colour=color(255,0,0);
    this.url =url;
    this.urls = urls;
    connected_nodes = new ArrayList<Node>();
  }
  
  Node(float x,float y,String url){
    super(x,y);
    physics.addBehavior(new AttractionBehavior2D(this, 90, -0.8));
    colour=color(255);
    highlight_colour=color(255,0,0);
    this.url =url;
    connected_nodes = new ArrayList<Node>();
  }
  
  Node(float x,float y){
    super(x,y);
    physics.addBehavior(new AttractionBehavior2D(this, 90, -0.8));
    colour=color(255);
    highlight_colour=color(255,0,0);
    connected_nodes = new ArrayList<Node>();
  }
  
  void show(){
    fill(this.colour);
    stroke(0);
    ellipse(x,y,16,16);
  }
  
  boolean isMouseinside(){
    float distance = pow(this.x-mouseX,2) + pow(this.y-mouseY,2);
    if(distance<pow(16,2)){
      return true;
    }
    else{
      return false;
    }
  }
  
  void highlight(){
    this.colour=highlight_colour;
  }
  
  void dehighlight(){
    this.colour=color(255);
  }
}
