"""My attempt at creating a bucket"""
import boto3

user_input = input("What is the name you would like to use for your bucket?: ")

s3 = boto3.client('s3')
s3.create_bucket(Bucket=user_input)


