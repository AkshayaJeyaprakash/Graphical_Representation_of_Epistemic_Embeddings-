import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

int noded_clicked,noded_pressed;
boolean is_node_clicked,is_node_pressed;
String start = "https://en.wikipedia.org/wiki/Wikipedia";
int depth=1;

VerletPhysics2D physics;
Graph g;
KnowledgeGraph g1 ;

void setup(){
  size(1000,1000);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,0)));
  physics.setWorldBounds(new Rect(10,10,width-20,height-20));
  
  try{
    g1 = new KnowledgeGraph("https://en.wikipedia.org/wiki/Main_Page",1);
  }
  catch(IOException ie){
    ie.printStackTrace();
  }
  g=g1.g;
}

void draw(){
  physics.update();
  if(is_node_clicked){
    Node node =(Node) g.nodes.get(noded_clicked);
    node.highlight();
  }
  
  if(is_node_pressed){
    Node node = (Node) g.nodes.get(noded_pressed);
    node.x=mouseX;
    node.y=mouseY;
  }
  background(0);
  stroke(255);
  g1.show();
}

void mouseReleased(){
  is_node_pressed=false;
  if(noded_pressed!=-1){
    Node node=(Node) g.nodes.get(noded_pressed);
  }
  noded_pressed=-1;
}

void mousePressed(){
  for(int i=0;i<g.nodes.size();i++){
    Node node=(Node) g.nodes.get(i);
    if(node.isMouseinside()){
      noded_pressed=i;
      is_node_pressed=true;
      break;
    }
  }
}

void mouseClicked(){
  Node n =(Node) g.nodes.get(noded_clicked);
  n.dehighlight();
  for(int i=0;i<g.nodes.size();i++){
    Node node=(Node) g.nodes.get(i);
    System.out.println(node.isMouseinside());
    if(node.isMouseinside()){
      is_node_clicked=true;
      noded_clicked=i;
      break;
    }
  }
}
