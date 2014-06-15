#include "Network.h"

#include <unordered_set>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <assert.h>
using namespace std;


Network::Network(string filename){
	unsigned int count = 0;
	numSelfLoops = 0;
	int ignoredSelfLoops = 0;
	unordered_set<string> alreadySeen;

	ifstream infile(filename);
	if(!infile){
		throw LineReadException(string("Given network file ")+filename+
			                    string(" failed to open!"));
	}
	string line;
	while(getline(infile,line)){
		istringstream iss(line);
		string a, b;
		node u, v;

		if (!(iss >> a >> b)){
			throw LineReadException(string("Parse error in network: ") + filename +
				                   string("on line: ") + line + "\n");
		}
/*
		if(a == b){
			ignoredSelfLoops++;
			continue;
		}
*/
		if(!alreadySeen.count(a)){
			alreadySeen.insert(a);
			nodeToNodeName[count] = a;
			nodeNameToNode[a] = count;
			u = count;
			count++;
		}
		else{
			u = nodeNameToNode.at(a);
		}

		if(!alreadySeen.count(b)){
			alreadySeen.insert(b);
			nodeToNodeName[count] = b;
			nodeNameToNode[b] = count;
			v = count;
			count++;
		}
		else{
			v = nodeNameToNode.at(b);
		}

		if(u == v){
			numSelfLoops++;
		}

		Edge e = Edge(u,v);

		edges.insert(e);

		//update adjacency list:
		adjList[u].insert(v);
		adjList[v].insert(u);
	}

	//cout<<"ignored "<<ignoredSelfLoops<<" self-loops"<<endl;
	//set up adjacency matrix
	for(int i = 0; i < nodeToNodeName.size(); i++){
		adjMatrix.push_back(vector<bool>(nodeToNodeName.size(),false));
	}

	for(auto i = adjList.begin(); i != adjList.end(); i++){
		node n = i->first;
		for(auto m : i->second){
			adjMatrix[n][m] = true;
		}
	}
    
    assert(nodeNameToNode.size() == nodeToNodeName.size());
}

int Network::degree(node x) const{
	if(adjList.count(x) == 0){
		return 0;
	}

	else{
		return adjList.at(x).size();
	}
}
