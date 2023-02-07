
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

