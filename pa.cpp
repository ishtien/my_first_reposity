#include <iostream>
#include <map>
#include <vector>
using namespace std;
typedef pair<int,int> pii;
map<int,int> M;
vector<int> V;
bool vis[1005];
main() {
//		ios::sync_with_stdio(false);
//		cin.tie(0);
		int n;
		M.clear();
		V.clear();
		while ( cin >> n ) {
				M[n]++;
				V.push_back(n);
		}
		for ( int i : V ) {
				if ( !vis[i] ) {
						cout << i << ' ' << M[i] << '\n';
						vis[i] = true;
				}
		}
		return 0;
}
