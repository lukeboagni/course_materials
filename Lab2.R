#left to right assignment operator
z=1

#right to left assignment operator 
2->y

#objects with different types
x=2.5
w=as.integer(3)
v='cabbage'
number=as.factor(1)

#custom operators
x%%w #mod function
x^w #expontential function
x%/%w #remainder


#Create an object that has a sequence of 10 numbers assigned to it
u=(1:10)

#Create three objects that each have a number assigned to them
#The code for all three objects must exists a single line in the script
#Add code to print the values of those three objects

a=1;b=2;c=3
print(a);print(b);print(c)

#Complete the following series of mathematical operations
x*y+z #multiplication then addition
x*(y+z) #parentheses the multiplication

#Inf, -Inf, NaN, NULL and NA
2^2000 #higher number than console can compute
-2^2000 #-inf
0/0 #nan = Not a number
m=matrix(data=1:10,nrow = 2,ncol = 3, dimnames = NULL) 
# null sets statement to false

#custom operator
'%myop%'=function(a,b){(a*2)+(b*3)}

#animals
animals=function(x){
  if(x=="d")
    "hummingbird"
  else if(x=="e")
    'sloth'
  else if(x=="f")
    'turtle'
  else if(x=="g")
    'whale shark'
  else 'snek'
}

#fish data script
load(fish)
nrow(fish)
ncol(fish)
str(fish)
#character: used for names, not numbers
#numeric: numeric data
#integer: integer data
#factor - allows you to sort different "levels"
#POSIXct - date time class
as.character(fish$area_fac)
remove(fish$avg.DNE.m)

