//CS 414 Programming Languages
//Instructor: Dr. Brady Rimes
//Student: John Knowles
//Email: jknowle2@my.athens.edu
//Assignment: Generation Zero Interpreter
//Assignment #: 1
//Due Date: August 31, 2016
#include <iostream>
#include <string>
#include <fstream>
#include <cmath>

using namespace std;

struct program {
	//struct for program
	int op;
	int opn1;
	int opn2;
	int dest;
};


void readData(struct program *init, struct program *prog)
{
	ifstream infile;
	infile.open("indata3.txt"); //indata1 indata2 indata3 for all 3 files
	if (infile.is_open())
	{
		bool test1 = false;
		int i = 0;
		while (test1 != true)
		{
			int temp = 0;
			infile >> temp;
			init[i].op = temp;
			if (temp == 9)
			{
				test1 = true;
			}
			infile >> temp;
			init[i].opn1 = temp;
			infile >> temp;
			init[i].opn2 = temp;
			infile >> temp;
			init[i].dest = temp;
			i++;
		}
		i = 0;
		test1 = false;
		while (test1 != true)
		{
			int temp = 0;
			infile >> temp;
			prog[i].op = temp;
			//cout << prog[i].op << endl;
			if (temp == 9)
			{
				test1 = true;
			}
			infile >> temp;
			prog[i].opn1 = temp;
			infile >> temp;
			prog[i].opn2 = temp;
			infile >> temp;
			prog[i].dest = temp;
			i++;
		}
		infile.close();
	}
	else
	{
		cout << "Input file didn't open" << endl;
	}
	return;
}

void zeroAry(long long myAry[])
{
	
	for (int i = 0; i < 1000; i++)
	{
		myAry[i] = 0;
	}
	return;
}


void loader(long long ary[], struct program *prgm)
{
	long long i = 0;
	long long inval = 0;
	bool test = false;
	while (test != true)
	{
		//cout << i << endl;
		switch (prgm[i].op)
		{
		case 0: //move to location
		{
			ary[prgm[i].dest] = ary[prgm[i].opn1];
			//cout << ary[prgm[i].dest] << endl;
			i++;
			break;
		}
		case 1: //addition
		{
			ary[prgm[i].dest] = (ary[prgm[i].opn1] + ary[prgm[i].opn2]);
			i++;
			break;
		}
		case -1: //subtract
		{
			ary[prgm[i].dest] = (ary[prgm[i].opn1] - ary[prgm[i].opn2]);
			i++;
			break;
		}
		case 2: //multiply
		{
			ary[prgm[i].dest] = ary[prgm[i].opn1] * ary[prgm[i].opn2];
			i++;
			break;
		}
		case -2: //division
		{
			ary[prgm[i].dest] = (ary[prgm[i].opn1] / ary[prgm[i].opn2]);
			//cout << ary[prgm[i].dest] << endl;
			i++;
			break;
		}
		case 3: //X to power of 2
		{
			ary[prgm[i].dest] = (ary[prgm[i].opn1] * ary[prgm[i].opn1]);
			i++;
			break;
		}
		case -3:
		{
			ary[prgm[i].dest] = sqrt(ary[prgm[i].opn1]);
			i++;
			break;
		}
		case 4:
		{
			if (ary[prgm[i].opn1] == ary[prgm[i].opn2])
			{
				//cout << ary[prgm[i].opn1] << " " << ary[prgm[i].opn2] << endl;
				i = prgm[i].dest;
				//cout << i << endl;
			}
			else
			{
				i++;
			}
			break;
		}
		case -4:
		{
			if (ary[prgm[i].opn1] != ary[prgm[i].opn2])
			{
				i = prgm[i].dest;
			}
			else
			{
				i++;
			}
			break;
		}
		case 5:
		{
			if (ary[prgm[i].opn1] >= ary[prgm[i].opn2])
			{
				i = prgm[i].dest;
			}
			else
			{
				i++;
			}
			break;
		}
		case -5:
		{
			if (ary[prgm[i].opn1] < ary[prgm[i].opn2])
			{
				i = prgm[i].dest;
			}
			else
			{
				i++;
			}
			break;
		}
		case 6:
		{
			int temp2 = 0;
			temp2 = prgm[i].opn1 + (int)ary[prgm[i].opn2];
			ary[prgm[i].dest] = ary[temp2];
			//cout << ary[temp2] << endl;
			i++;
			break;
		}
		case -6:
		{
			int temp = 0;
			temp = prgm[i].opn2 + (int)ary[prgm[i].dest];
			ary[temp] = ary[prgm[i].opn1];
			//cout << ary[temp] << endl;
			i++;
			break;
		}
		case 7:
		{
			ary[prgm[i].opn1]++;
			if (ary[prgm[i].opn1] < prgm[i].opn2)
			{
				i = prgm[i].dest;
				//inctest = true;
			}
			else
			{
				i++;
			}
			break;
		}
		case 8:
		{
			cin >> inval;
			ary[prgm[i].dest] = inval;
			i++;
			break;
		}
		case -8:
		{
			cout << ary[prgm[i].dest] << endl;
			i++;
			break;
		}
		case 9:
		{
			test = true;
			break;
		}
		default:
		{
			cout << "Error! Broken Data file!" << endl;
			test = true;
			break;
		}
		
		}
		
		
	}
	return;
}

int main()
{
	long long dataAry[1000];
	//array for data to be stored for program
	zeroAry(dataAry); //set default const zero
	//cout << dataAry[1] << endl;
	program myInit[1000]; //create init struct
	program myProg[1000]; //create program struct

	readData(myInit, myProg); //read init and program data from file to structs

	loader(dataAry, myInit); //load init data
	loader(dataAry, myProg); //load program data
	/*for (int i = 15; i <265; i++)
	{
		cout << dataAry[i] << endl;
	}
	cout << dataAry[2] << endl;
	cout << dataAry[11] << endl;*/
	return 0;
}
