num<- -10
if(num > 0){
  print("positive")
} else if (num<0){
  print("negative")
} else {
  print ("zero")
}

i=11
if(i %% 2 ==0){
  print("even")
} else if(i %% 2 !=0){
  print("odd")
}

#if, else if, else condition syntax
if(condition1) {
  #do something
} else if (condition2) {
  #do something
} else if (condition3) {
  #do something
} else if (condition4) {
  #do something
} else {
  #do something
}

#ifelse function in a line(narrow version)
num<- 10
ifelse (num<0,"negative", "positve")

#lfor oop function or syntax
for (var in a sequence) {
  #do something (task)
}
for (i in 1:10) {
  print(i)
}
for (i in 10:1) {
  print(i)
}
# condition in for loop function
#print only even number
for (i in 1:20) {
  if (i%%2==0) {
    print(i)
  }
}
#print only odd number
for(i in 1:20) {
  if (i%%2!=0) {
    print(i)
  }
}
#vector_creation
# collection~ c function
num_vec <- c(12,23,24,24)
class(num_vec)
class_vec <- c("female","male","male","female")
class(class_vec)
class_vec[4]
class_vec[2:4]
seq(15,50,3)
#factor
gender <- c("female","male","male","female")
gender <- factor(c("female", "male", "male", "female"))
factor(gender)
#matrix
matrix(1:20)
matrix(1:9,nrow=3)
matrix(1:9,nrow=3,ncol=3)
matrix(1:9, nrow=3, ncol=3, byrow=TRUE)
mat <- matrix(1:9, nrow=3, ncol=3)
dim(mat)
#data frame
data.frame(age= c(12,23,34,45),
           gender = c("female","male"))
df <- data.frame(
  age= c(12,23,34,45),
  gender = c("female","male")
)
#access
df$age
df$gender

