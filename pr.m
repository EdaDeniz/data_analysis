%Reading dataset and getting the inputs from user by using input operation
matrix = xlsread("Transfusion.xlsx");
%Find attribute numbers in the dataset
attributesNum = size(matrix,2) - 1 ;
%create an empty matrix for inputs
X = zeros(attributesNum,1);
%Ýt is a for loop for take inputs from user
for i=1:attributesNum
    values = input('Enter Value: ');
    X(i,1) = values;
end

%By using this, we create 2 matrices. class 0 and class 1

mask = matrix(:,end) == 0;
c0 = matrix(mask,:);
c1 = matrix(~mask,:);


%By using the input data we will first find the mean of each classes means
%of columns. To do that we are going to use mean() operation. This
%operation takes the mean of each column of each class

m0 = zeros(attributesNum,1);
m1 = zeros(attributesNum,1);
for i=1:attributesNum
    for j=1:attributesNum
        m0(i)= mean(c0(i,j));
        m1(i)= mean(c1(i,j));
        
    end
end


%By using those mean values we are going to find centered data matrix of
%the dataset for each column of each class

z0=zeros();
meanC0 = mean(c0);
Z0 = c0' - meanC0';
for i=1:attributesNum
    for j=1:attributesNum
        z0(i,j)= Z0(i,j);
    end
end


z1 = zeros();
meanC1 = mean(c1);
Z1 = c1' - meanC1';
for i=1:attributesNum
    for j=1:attributesNum
        z1(i,j)= Z1(i,j);
    end
end


%At this part we are calculating the standard deviation of each column of
%each classes centered data matrix columns
arr0 = [];
arr0=size(attributesNum);
stdC0 = [];
for a=1:size(z0,1)
    for b=1:size(z0,1)
        
        arr0 = [arr0 z0(a,b)];
        stdC0(1,b) = var(arr0);
        
    end
end

arr1 = [];
arr1=size(attributesNum);
stdC1 = [];
for a=1:size(z1,1)
    for b=1:size(z1,1)
        
        arr1 = [arr1 z1(a,b)];
        stdC1(1,b) = var(arr1);
        
    end
    
    
end

%In this part we are calculating the size of both classes and the whole
%matrix. Then after we found those values we are going to find the
%probability of each classes


n0 = size(c0,1);
n1 = size(c1,1);
n = size(matrix,1);

Pc0 = n0/n;
Pc1 = n1/n;

%In this part we compute the probability density function (pdf) values evaluated at the values in xi i=1,2,3,4 for the normal distribution with mean mu and standard deviation sigma.

xes = zeros(attributesNum,1);
for p = 1 : attributesNum
    xes(p) = X(p,1);
end

probs0 = zeros(attributesNum,1);

for q=1:attributesNum
    for w=1:attributesNum
        probs0(q,1) = 1/sqrt(2*pi*stdC0(1,w))*exp(-(xes(q)-m0(q))^2/(2*stdC0(1,w)));
        
        
    end
end
probs1 = zeros(attributesNum,1);
for q=1:attributesNum
    for w=1:attributesNum
        probs1(q,1) = 1/sqrt(2*pi*stdC1(1,w))*exp(-(xes(q)-m1(q))^2/(2*stdC1(1,w)));
        
        
    end
end

%Then we  are going to multiply all the probabilities of each classes with
%probability density function of the class( For each class seperately).
%Then we take the maximum of the two values that we calculate. Then answer
%is the maximum one. Which one is maximum, it is the class what the user
%input included.

fc0=1;
for t=1:attributesNum
    
    fc0 = fc0 * probs0(t);
    
end
Class0 = fc0 * Pc0;

fc1=1;
for t=1:attributesNum
    
    fc1 = fc1 * probs1(t);
    
end

Class1 = Pc1 * fc1;


y = max(Class0,Class1);

%Then we are print our result.

if y == Class0
    disp("According to input data, He/she did not donate blood in March 2017");
else
    disp("According to input data, He/she did donate blood in March 2017");
    
end