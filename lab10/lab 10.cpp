#include<iostream>
using namespace std;

int max(int r[],int n)
{
    int pos,i,l,max=0;
    for(i=0;i<n;i++)
    {
        if(r[i]>max)
        {
            l=r[i];
            max=r[i];
            pos=i;
        }
    }
    return pos;
}

void read(int a[],int n)
{
    int i;
    for(i=0;i<n;i++)
    {
        cin>>a[i];
    }
}

void display(int b[],int n)
{
    int i;
    for(i=0;i<n;i++)
    {
        cout<<b[i]<<" ";
    }
}

void timer_confg(int tmr[],int pos)
{
    int j=pos;
    switch(pos)
    {
        case 0:
            tmr[j]=0;
            tmr[j+1]=tmr[j+1]++;
            tmr[j+2]=tmr[j+2]++;
            break;
        case 1:
            tmr[j]=0;
            tmr[j-1]=tmr[j-1]++;
            tmr[j+1]=tmr[j+1]++;
            break;
        case 2:
            tmr[j]=0;
            tmr[j-1]=tmr[j-1]++;
            tmr[j-2]=tmr[j-2]++;
            break;
    }
}
int main()
{
    int pg[20],tmr[20],i,j,n,pf=0,rs[20],m,avail=0;
    cout<<"Enter number of frames: ";
    cin>>n;
    for(i=0;i<20;i++)
    {
        pg[i]=-1;
    }
    cout<<"Enter the number of pages:";
    cin>>m;
    cout<<"Enter the reference string: ";
    read(rs,m);
    int pos;
    tmr[0]=2;
    tmr[1]=1;
    tmr[2]=0;
    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        {
            if(pg[j]==-1)
            {
                pg[j]=rs[i];
                avail=1;
                pf++;
                cout<<"This page "<<rs[i]<<" is PLACED in the frame "<<j<<endl;
                break;  
            }
            else
            {
                if(pg[j]==rs[i])
                {
                    pos=j;
                    timer_confg(tmr,pos);
                    avail=1;
                    cout<<"This page "<<rs[i]<<" is already in the frame "<<j<<endl;
                    break;
                }

                else
                {
                    if(avail==0 || j==(n-1))
                    {
                        pos=max(tmr,n);
                        pg[pos]=rs[i];
                        pf++;
                        timer_confg(tmr,pos);
                        cout<<"The page "<<rs[i]<<" is replaced with frame "<<pos<<endl;
                        break;  
                    }
                }   
            }   
        }
    }
    cout<<"The total number of page fault is:"<<pf;
    return 0;
}
