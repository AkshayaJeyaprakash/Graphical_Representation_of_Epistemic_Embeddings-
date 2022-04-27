# Graphical_Representation_of_Epistemic_Embeddings-

# Introduction

Epistemological connections between seemingly unrelated domains remain stringent for the human brain to capture. Technologies such as Google&#39;s page rank, do capture these epistemological connections inherently, yet it&#39;s not intuitive for a human brain to digest.

The act of surfing knowledge is much more accessible now than ever before in history. Gazillions of materials are just a single click away. Much more often than not, it becomes quite tedious to make sense of this ordered chaos, to extract what you need from this ocean of texts.

This project shall aim at one such visualization of Graph Representation of Epistemic Embeddings on Wikipedeic réseau. Such representations shall aid the user to get a birds eye view of the epistemic connections as well as help technologies like knowledge graphs to build upon it. We shall crawl starting from a given Wikipedia topic, to a defined depth, capturing the relationships between &quot;Wikipedia pages&#39;&#39;.

# Summary of Classes

| **s.no** | **class** | **description** |
| --- | --- | --- |
| **1** | **Crawler** | Utility class to crawl a given wikipedia site and extract all the links from it |
| **2** | **Graph** | Native implementation of the graph data structure. Has nodes of Node objects and edges indicating if a node corresponding to a wikipedia page has a reference to another page |
| **3** | **KnowledgeGraph** | Wrapper around Graph, to crawl,and build the knowledge graph starting from a root node. |
| **4** | **Node** | Building block of our Graphs. Each node corresponds to a unique url, and also has references to its connected nodes. |
| **5** | **DSAProject** | It is the driver class. Used to set up and draw things on the screen. |

# 1. Crawler

## 1a. Properties summary

| **s.no** | **variable** | **description** |
| --- | --- | --- |
| **1** | **URL** url | The variable which stores the URL object of a url link of the wikipedia website which is to be parsed |
| **2** | **URLConnection** conn | A variable to store an object of the URLConnection class which is used to represent a communication link between the URL and the application |
| **3** | **BufferedReader** stream | A variable to store an object of the BufferedReader class which is used to Read text from a character input stream, buffering characters so as to provide for the efficient reading of characters, arrays, and lines. |
| **4** | **String** rooturl | A variable which is used to store the string of url link of the wikipedia website which is to be parsed |

## 1b. Constructor summary

| **s.no** | **constructor** | **usage** |
| --- | --- | --- |
| **1** | Crawler() | The constructor Crawler() which doesn&#39;t accept any parameter simply instantiates the three properties url, conn and stream to null values. |
| **2** | Crawler( **String** url) | The constructor Crawler(String url) which accepts the string url which is the url link of the wikipedia website which is to be parsed is used to create a new URL object which points to a resource on the World Wide Web, instantiates a connection object and assign it to URLConnection instance that represents a connection to the remote object referred to by the URL, instantiates a bufferedreader object and assigns it to InputStreamReader object which returns an InputStream representing the data and throws the appropriate exception if it cannot do so and the string values url is stored in the property rooturl. |

## 1c. User-defined methods

| **s.no** | **method** | **usage** |
| --- | --- | --- |
| **1** | **ArrayList**** \&lt; ****String**** \&gt;** crawl() | This method doesn&#39;t accept any arguments. It creates 3 different variables at the time of invocation, the first one is &#39;inputline&#39; which stores the HTML code of the website and two arraylists URLs and URLss are created. This method is used to populate the list URLs with the URL of the hyperlinks present in any website. The URLs present in this list are then filtered and valid URLs from this are stored in the list URLss. Here the number of hyperlinks fetched is limited to 9, since fetching all the hyperlinks becomes a time-consuming process. |
| **2** | **ArrayList**** \&lt; ****String**** \&gt;**crawl(**String** url) | This method which accepts the string url which is the url link of the wikipedia website which is to be parsed as an argument initially performs the tasks which are done by the constructor Crawler(String url) and in the latter part it completes the same task done by the method crawl() which accepts no arguments. |
| **3** | **String** ToString ( **ArrayList**** \&lt; ****Character**** \&gt;** list) | This method accepts an arraylist of character elements and converts it to an arraylist of string elements. |

# 2. Graph

## 2a. Properties summary

| **s.no** | **variable** | **description** |
| --- | --- | --- |
| **1** | **int** [][] adjacency\_matrix | Variable used to store the adjacency matrix of a graph which is to be displayed on the set-up |
| **2** | **int** n\_nodes | Variable used to store the total number of nodes which is to be be displayed in a graph |
| **3** | **ArrayList**** \&lt; ****Node**** \&gt;** nodes | Variable which is used to store the list of all the node objects which are to be displayed in the graph |
| **4** | **boolean** adj | Variable used to store if a node is adjacent to another or not |
| **5** | **Crawler** crawler | Variable of Crawler class created in order to invoke functions from crawler class whenever needed. |

## 2b. Constructor summary

| **s.no** | **constructor** | **usage** |
| --- | --- | --- |
| **1** | Graph() | The constructor Graph() which accepts no parameters simply instantiates the property adjacency\_matrix with null, instantiates the variable adj to false, n\_nodes to zero, nodes to an empty arraylist and creates a new crawler object for it. |
| **2** | Graph( **int** [][] adjmatrix) | The constructor Graph(int [][] adjmatrix) which accepts an adjacency matrix as it&#39;s argument, first assigns the length of first row of the matrix to the variable n\_nodes, the adjacency matrix to the variable adjacency\_matrix and creates a new arraylist to store the list of node objects created. Using a for loop it also creates a new node object with a randomly generated position vector for it position vector stored in the variable offsetvec, appends the reference to the new node object created to the arraylist nodes and finally invokes the connect function to create an edge object between 2 connected nodes. |

## 2c. User-defined methods

| **s.no** | **method** | **usage** |
| --- | --- | --- |
| **1** | **void** addNode() | This method doesn&#39;t accept any arguments. It generates a new random vector which points from the centre, creates a new node object at the random coordinate generated and appends the reference to the node object in the arraylist &quot;nodes&quot;. It also increments the number of nodes by 1 and adds a new particle in the graph to be displayed. |
| **2** | **Node** addNode( **String** url) | This method which accepts the string url which is the url link of the wikipedia website which is to be parsed as an argument checks if the node object corresponding to the URL is present in the list of node of objects, if it is present, the method returns a reference to that node object, if it is not present it performs the same tasks as the addNode() method does. |
| **3** | **boolean** isInNodes( **String** url) | This method accepts the string url which is the url link of the wikipedia website which is to be parsed as an argument and checks if the corresponding node object is present in the arraylist &quot;nodes&quot;, returns TRUE if it is present and FALSE if it is absent. |
| **4** | **void** addEdge( **Node** a, **Node** b) | This method accepts two node objects as it&#39;s argument and creates an edge object between the same. This method also appends node &quot;a&quot; to the list of connected nodes of &quot;b&quot; and appends &quot;b&quot; to the list of connected nodes of &quot;a&quot;. |
| **5** | **void** addEdge( **int** x, **int** y) | This method accepts two integers &quot;x&quot; and &quot;y&quot; which correspond to the position of reference to the node objects of two nodes in order to fetch the node object corresponding to it and performs the same task as addEdge(Node a,Node b) using the two fetched nodes. |
| **6** | **void** connect() | This method accepts no arguments and uses the adjacency matrix in order to create a new spring object between the two nodes which correspond to the (row,column) ordered pair where the (row,column)th element of the adjacency matrix is 1. |
| **7** | **Node** findNode( **String** url) | This method accepts the string url which is the url link of the wikipedia website which is to be parsed as an argument. This method checks if the node object corresponding to the URL is present in the arraylist &quot;nodes&quot;, if it is present it returns the reference to the corresponding node object and if it is not present, the method returns a new node object corresponding to this URL. |
| **8** | **void** show() | This method is used to display circles in the place of all node objects and is used to display lines in the place of all spring objects or node objects. |

# 3. Knowledge Graph

## 3a. Properties summary

| **s.no** | **variable** | **description** |
| --- | --- | --- |
| **1** | **String** url | A variable which is used to store the string of url link of the wikipedia website which is to be parsed |
| **2** | **ArrayList**** \&lt; ****String**** \&gt;** nodes\_url | A super set array of the list of all nodes which is present in the graph object |
| **3** | **int** depth | A variable which represents the maximum number of edges between the root node and leaf node or the number of recursion the parsing process is to be performed |
| **4** | **Graph** g | A graph object created in order to invoke the function from graph class whenever needed |

## 3b. Constructor summary

| **s.no** | **constructor** | **usage** |
| --- | --- | --- |
| **1** | KnowledgeGraph
 ( **String** url, **int** depth) | Accepts string of url link of the wikipedia website which is to be parsed and depth as an argument, assigns both to the corresponding property, creates a new graph object and adds the corresponding node object to graph. It also iterates through the list of all hyperlinks of this url, adds the corresponding node object to the graph object and invokes the discover() method. |

## 3c. User-defined methods

| **s.no** | **method** | **usage** |
| --- | --- | --- |
| **1** | **void** discover
 ( **Node** rootnode) | This method accepts a node object &quot;rootnode&quot; as its argument and iterates through all nodes which are present in it&#39;s adjacency list, prints them and creates an edge object between these two nodes if there already exists a node object for it, else creates a new node object and creates an edge object between those. |
| **2** | **void** show() | This method is used to display the current graph object. |

# 4. Node

## 4a. Properties summary

| **s.no** | **variable** | **description** |
| --- | --- | --- |
| **1** | **ArrayList**** \&lt; ****String**** \&gt;** urls | A super set array of the list of all nodes which is present in the graph object |
| **2** | **String** url | A variable which is used to store the string of url link of the wikipedia website which is to be parsed |
| **3** | **ArrayList**** \&lt; ****Node**** \&gt;**
 connected\_nodes | A variable to store the list of all nodes connected to a particular node. |
| **4** | **color** highlight\_colour | A variable to store colour codings of node to be shown when it is being highlighted |
| **5** | **color** colour | A variable to store colour codings of node to be shown when it is being not highlighted |

## 4b. Constructor summary

| **s.no** | **constructor** | **usage** |
| --- | --- | --- |
| **1** | Node() | This constructor which doesn&#39;t accept any argument creates a node object which inherits from verletParticle2D where the position is set to (0,0) |
| **2** | Node( **float** x, **float** y, **String** url, **ArrayList**** \&lt; ****String**** \&gt;** urls) | This constructor accepts two floating point numbers x and y where (x,y) corresponds to the coordinate at which the new node object inherited from VerletParticle2D is to be created. This constructor creates a new node object at the necessary location, adds attraction behaviour between the adjacent particles, assigns the URL to the property url of this node and list of connected URLs to the urls property of this node, defines the colour code when a node is highlighted and finally creates a new arraylist of node objects to store the reference to node object of the connected nodes |
| **3** | Node ( **float** x, **float** y,
**String** url) | This constructor accepts two floating point numbers x and y where (x,y) corresponds to the coordinate at which the new node object inherited from VerletParticle2D is to be created. This constructor creates a new node object at the necessary location, adds attraction behaviour between the adjacent particles, assigns the URL to the property url of this node , defines the colour code when a node is highlighted and finally creates a new arraylist of node objects to store the reference to node object of the connected nodes. |
| **4** | Node( **float** x, **float** y) | Performs the same tasks as the above constructor. |

## 4c. User-defined methods

| **s.no** | **method** | **usage** |
| --- | --- | --- |
| **1** | **void** show() | Used to display circles corresponding to node object along with a label to each node |
| **2** | **boolean** isMouseinside() | Used to compare the coordinates where the mouse is pressed to the coordinates of nodes |
| **3** | **void** highlight() | Used to highlight a particular node |
| **4** | **void** dehighlight() | Used to dehighlight a particular node |

# 5. DSA Project

## 5a. Properties summary

| **s.no** | **variable** | **description** |
| --- | --- | --- |
| **1** | **int** noded\_clicked | Variable to store the index of the node which is clicked |
| **2** | **int** noded\_pressed | Variable to store the index of the node which is pressed |
| **3** | **boolean** is\_node\_clicked | Variable to store is a node is clicked or not, TRUE if a node is clicked and FALSE if it is not |
| **4** | **boolean** is\_node\_pressed | Variable to store is a node is pressed or not, TRUE if a node is pressed and FALSE if it is not |
| **5** | **boolean** is\_locked | Variable to store if the nodes of the graph are locked or not i.e., fixed in their positions or not |

## 5b. Methods summary

| **s.no** | **method** | **description** |
| --- | --- | --- |
| **1** | **void**** setup()** | Used to define the size and other properties of the display window and invoke the functions which correspond to the objects being displayed on the display window |
| **2** | **void draw()** | Has built-in looping properties. Used to update the portion of each particle (node object) every second. Also changes the colour of a node if it is clicked for the first time and highlights the node if it is already highlighted and invokes the functions which correspond to the graph to be displayed. It is also used to define the background colour and stroke colour. |
| **3** | **void**** keyPressed()** | Lock the position of the nodes if they are in an unlocked state and unlock them if they are in a locked state whenever any key is pressed |
| **4** | **void**** mouseReleased()** | Updates the value of the variable is\_node\_pressed and fetches the values of the variable node\_pressed whenever mouse is released |
| **5** | **void**** mousePressed()** | Compares the coordinate of mouse pointer with the position of each node and updates the value of the variable node\_pressed whenever mouse is pressed |
| **6** | **void**** mouseClicked()** | Compare the coordinate of the mouse pointer with the position of each node and update the value of the variable node\_clicked whenever mouse is clicked and open the URL that corresponds to that node in the default browser being used. |

# UML diagram

![](RackMultipart20220427-1-pd6gl3_html_4f9fd0b2c77ee392.png)

# Output

![](RackMultipart20220427-1-pd6gl3_html_d7c254e484933062.png)

# Conclusion

This project proves to be a successful implementation of a HTML parser and a Web Crawler bonded together in order to visualize Graph Representation of Epistemic Embeddings on Wikipedeic réseau which shall aid the user to get a bird&#39;s eye view of the epistemic connections as well as help technologies like knowledge graphs to build upon it. As a further improvement this can be integrated with Natural Language Processing
