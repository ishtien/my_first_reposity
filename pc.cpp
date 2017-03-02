#include <iostream>
#include <sstream>
using namespace std;
int p[10005];
int find(int x) {
		return ((p[x]==x) ? x : (p[x]=find(p[x])));
}
void U(int x, int y) {
		p[find(y)] = find(x);
}
main() {
		int t, n, a, b;
		cin >> t;
		string s;
		getline(cin,s);
		while ( t-- ) {
			cin >> n;
			for(int i=1; i<=n; i++)	p[i] = i;
			getline(cin,s);
			getline(cin,s);
			istringstream ss(s);
			int x, y;
			while (ss >> x >> y) {
					if ( find(x) !=find(y) ) {
						U(x,y);
						n--;
					}
			}
			cout << n << '\n';
			if ( t > 0 )	{
				cout << '\n';
			}
			getline(cin,s);
		}
		return 0;
}

