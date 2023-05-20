
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


//Если файл является неубывающим,то записать во второй  файл модуль
//отрицательных,иначе записать в третий файл элементы,в записи которых  втстречается 3,увеличенные на введенное пользователем число.
//Пример 1:
//Введите число для второго варианта : 5
//Введите числа в файл : -10 - 5 - 3 - 2 - 1 1 2 3 100 115 0
// Пример 2:
//Введите число для второго варианта : 5
//Введите числа в файл : -100 - 5 10 13 3 10 43 23 0
#include <iostream>
#include<fstream>
using namespace std;
bool neub(int* a, int i)
{
    for (int j = 0; j < i-1; j++)
    {
        if (a[j] > a[j + 1])
            return false;
    }
    return true;
}
bool three(int x)
{
    while (x)
    {
        if (abs(x) % 10 == 3)
        {
            return true;
        }
        x /= 10;
    }
    return false;
}
int main()
{
    setlocale(LC_ALL, "rus");
    cout << "Введите число для второго варианта: ";
    int n;
    cin >> n;
    cout << "Введите числа в файл: ";
    ofstream f1("f1.txt");
    int x;
    for (cin >> x; x != 0; cin >> x)
    {
        f1 << x;
        f1.width(5);
    }
    f1.close();
    ifstream f1_in("f1.txt");
    int* a = new int[0];
    int i = 0;
    while (!f1_in.eof() && f1_in >> x)
    {
        a[i] = x;
        i++;
    }
    f1_in.close();
    if (neub(a, i))
    {
        ofstream f2("f2.txt");
        f1_in.open("f1.txt");
        while (!f1_in.eof() && f1_in >> x)
        {
            if (x < 0)
            {
             f2 << abs(x);
             f2.width(5);
            }
        }
        f1_in.close();
        f2.close();
    }
    else
    {
        ofstream f3("f3.txt");
        f1_in.open("f1.txt");
        while (!f1_in.eof() && f1_in >> x)
        {
            if (three(x))
            {
                f3 << x + n;
                f3.width(5);
            }
        }
        f1_in.close();
        f3.close();
    }
}


