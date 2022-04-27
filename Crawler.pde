import java.net.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;

class Crawler{
  URL url;
  URLConnection conn;
  BufferedReader stream;
  String rooturl;
  
  Crawler() throws IOException{
    this.url = null;
    this.conn = null;
    this.stream = null;
  }
  
  Crawler(String url) throws IOException{
    this.url = new URL(url);
    this.conn = this.url.openConnection();
    this.stream = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    this.rooturl=url;
  }
  
  
  ArrayList<String> crawl() throws IOException{
    String inputline;
    ArrayList<String> URLss = new ArrayList<String>();
    ArrayList<String> URLs = new ArrayList<String>();
    while((inputline=this.stream.readLine())!=null){
      int idx = inputline.toString().indexOf("<a href");
      ArrayList<Character> currentlink = new ArrayList<Character>();
      if(idx!=-1){
        String current_line = inputline.toString();
        for(int i=idx+9;i<current_line.length();i++){
          char current_char=current_line.charAt(i);        
          if(current_char =='\"'){
            String link_ = ToString(currentlink);
            System.out.println(link_);
            URLs.add(link_);
            break;
          }
          currentlink.add(current_char);
        }
      }
    }
    this.stream.close();
    for(String url_:URLs){
      if(url_.startsWith("h")){
        URLss.add(url_);
      }
      else if(url_.startsWith("/wiki")){
        String temp = "https://wikipedia.org"+url_;
        URLss.add(temp);
      }
      else if(url_.startsWith("//")){
        URLss.add("https:"+url_);
      }
    }
    return URLss;
  }
  
  ArrayList<String> crawl(String url) throws IOException{
    this.url = new URL(url);
    this.conn = this.url.openConnection();
    this.stream = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    
    String inputline;
    ArrayList<String> URLss = new ArrayList<String>();
    ArrayList<String> URLs = new ArrayList<String>();

    while((inputline=this.stream.readLine())!=null){
      int idx = inputline.toString().indexOf("<a href");
      ArrayList<Character> currentlink = new ArrayList<Character>();
      if(idx!=-1){
        String current_line = inputline.toString();
        for(int i=idx+9;i<current_line.length();i++){
          char current_char=current_line.charAt(i); 
          if(current_char =='\"'){
            String link_ = ToString(currentlink);
            //System.out.println(link_);
            URLs.add(link_);
            break;
          }
          currentlink.add(current_char);
        }
      }
    }
    this.stream.close();
    for(String url_:URLs){
      if(url_.startsWith("h")){
        URLss.add(url_);
      }
      else if(url_.startsWith("/wiki")){
        String temp = "https://wikipedia.org"+url_;
        URLss.add(temp);
      }
      else if(url_.startsWith("//")){
        URLss.add(url_);
      }
    }
    return URLss;
  }
  
  
  String ToString(ArrayList<Character> list){
    StringBuilder builder = new StringBuilder(list.size());
    for(Character ch: list){
      builder.append(ch);
    }
    return builder.toString();
  }
}
