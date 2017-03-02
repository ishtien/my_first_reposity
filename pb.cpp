#include <iostream>
#include <map>
using namespace std;
map<char,char> ch;
map<string,int> M;
main() {
		int row=0;
		char cnt = '2';
		for (int i=65;i<=90; i++ ) {
				char c = i;
				if ( c == 'Q' || c == 'Z' )	continue;
				ch[c] = cnt;
				row++;
				if(row%3==0) {
					row = 0;
					cnt++;
				}
		}
		int t;
		cin >> t;
		while ( t-- ) {
				M.clear();
				int n;
				cin >> n;
				while ( n-- ) {
					string s, t="";
					cin >> s;
					for ( int i=0; i<s.size(); i++ ) {
						if ( t.size() == 3 )	t.push_back('-');
						if ( s[i] == '-' )	continue;
						if ( s[i] >= 65 )	t.push_back(ch[s[i]]);
						else	t.push_back(s[i]);
					}
					M[t]++;
				}
				bool flag = true;
				for ( auto i=M.begin(); i!=M.end(); i++ ) {
						pair<string,int> tmp = *i;
						if ( tmp.second > 1 ){
							cout << tmp.first<<' ' <<tmp.second<<'\n';
							flag = false;
						}
				}
				if( flag)	cout <<"No duplicates.\n";
				if ( t > 0 )
					cout<<'\n';
		}
		
		return 0;
}
