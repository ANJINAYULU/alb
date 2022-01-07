import boto3
import json
client = boto3.client('ec2')

s1=client.describe_security_groups()
for i in s1['SecurityGroups']:
    print("security_group_name=",i['GroupName'])


s2=client.describe_instances()
for j in s2['Reservations']:
    print('instance id=',j['Instances'][0]['InstanceId'])
# print(s2)

client1=boto3.resource('s3')
s3=client1.buckets.all()
for k in s3:
    print("bucketName=",k.name)