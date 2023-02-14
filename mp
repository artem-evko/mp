
#include <iostream>
using namespace std;
struct school
{
    char number;
    int vid;
    int pot;
};
void tovar(school& x)
{
    cin >> x.number;
    cin >> x.vid;
    cin >> x.pot;
}
void QuickSort(school* a, int first, int last)
{
    school mid;
    school temp;
    int f = first, l = last;
    mid = a[(f + l) / 2];
    do
    {
        while (a[f].vid - a[f].pot > mid.vid - mid.pot)
            f++;
        while (a[l].vid - a[l].pot < mid.vid - mid.pot)
            l--;
        if (f <= l)
        {
            temp = a[f];
            a[f] = a[l];
            a[l] = temp;
            f++;
            l--;
        }

    } while (f < l);
        if(first < l)
            QuickSort(a, first, l);
        if (f < last)
            QuickSort(a, f, last);
}
int main()
{
    int kol;
    cin >> kol;
    school* a = new school[kol];
    for (int i = 0; i < kol; i++)
        tovar(a[i]);
    QuickSort(a, 0, kol-1);
    for (int i = 0; i < kol; i++)
        cout << a[i].number << ' ';
    delete[]a;
    return 0;
}



#include <iostream>
#include<string>
using namespace std;
int main()
{
    int n;
    cin >> n;
    int m1 = 0, m2 = 0, bal, school, kol1 = 0, kol2 = 0;
    string stud,name1,name2;
    for (int i = 0; i < n; i++)
    {
        cin >> stud >> school >> bal;
        if (school == 50)
        {
            if (bal > m1)
            {
                if (kol1 == 0)
                {
                    m1 = bal;
                  name1 = stud;
                  kol1++;
                }
                else
                {
                    m2=m1;
                    m1 = bal;
                    name2 = name1;
                    name1 = stud;
                    kol2++;
                }
            }
            if ((bal < m1) && (bal >= m2))
            {
                m2 = bal;
                kol2++;
                name2 = stud;
            }
            else
                if ((bal == m1) && (stud != name1))
                {
                    name2 = stud;
                    kol1++;
                    m2 = bal;
                }
        }
    }
    if ((kol1 == 1) && (kol2 == 1))
        cout << name1 << " " << name2;
    if ((kol1 == 1) && (kol2 > 1))
        cout << name1;
    if (kol1 > 2)
        cout << kol1;
    if (kol1 == 2)
        cout << name1 << " " << name2;
}


