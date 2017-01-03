# HandbooksTraining
dummy commit 

## Presentations
* https://s3-us-west-2.amazonaws.com/target-trng/TargetPPT.zip

## Handbook Guides
* https://s3-us-west-2.amazonaws.com/target-training/Handbooks.zip

## Steps
* Download keys
  * Linux : https://s3-us-west-2.amazonaws.com/target-training/targetkey.pem
  * Windows : https://s3-us-west-2.amazonaws.com/target-training/targetkey.ppk
* Login to your VM's using ubuntu user
  * Linux:
    * Change permissio of targetkey
    ```chmod 600 targetkey.pem```
    * ssh -i targetkey.pem ubuntu@54.69.71.93
  * Windows: Use Putty to login to the system
* Do initial setup of system
  * Go to HandbooksTraining directory
  ```$ cd HandbooksTraining```
  * Update the code to latest state
  ```git pull origin master```
* Do initial setup of puppet
``` cd puppet```
``` make build-image```
``` make run-image```


PawanKumar.Sharma
52.88.60.193
 
Anuj
54.69.71.93
 
SunilKumar.Devangam
52.39.127.185
 
Amitesh.Dubey
54.70.119.97
 
Darpana.Sinha
52.26.175.81
 
Godha.narayana
52.37.21.221
 
Basudev.Kar
52.36.161.137
 
Joe.Dominic
52.39.25.15
 
test
 
Sunil.Aravindakshan
52.41.206.30
 
Sharafudheen.VK
52.27.37.210
 
Sureshkumar.Sankarapani
54.69.255.208
 
Praveen.Samayaji
52.42.4.154
 
Ashish.Uniyal
54.69.235.22
 
SandipSengupta
52.89.150.13
 
Prasanna.Kundapur
52.88.55.48
 
Arunkumar.KG
52.37.74.123
 
Rekha.Krishnamurthy
54.68.96.28
sandeep
