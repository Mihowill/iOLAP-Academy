## Task - Answers
## Task 1
[1] The best practice would be to implement a data lifecycle policy that would transfer files after 90 days into S3 - Standard - Infrequent Access or something like S3 Glacier Deep Archive if it's going to be accessed rarely. For the part about deleting certain objects withing 1 day after coming to bucket, we would need to configure another lifecycle policy with expiration of 1 day using JSON format.
# Task 2
[2] S3 Standard - Infrequent Access, S3 Glacier Flexible Retrieval or S3 Glacier Deep Archive 
    If we use S3 standard - Infrequent Access it would cost us 691.20$ per month because it is 0.0135$/GB.
## Task 3
[3] It costs $0.01 per 1000 requests for S3 Standard - Infrequent Access and $0.06 per 1000 requests for S3 Glacier Deep Archive for example.
    Since I used S3 Standard - Infrequent Access for the second task it would cost us 200,000$ for transfer since it is 0.01$ per 1000 requests.
## Task 4
[4] Pricing is copied straight from AWS documentation:
* `S3 Standard - General purpose storage for any type of data, typically used for frequently accessed data	
First 50 TB / Month	$0.0245 per GB
Next 450 TB / Month	$0.0235 per GB
Over 500 TB / Month	$0.0225 per GB`
* `S3 Standard - Infrequent Access ** - For long lived but infrequently accessed data that needs millisecond access	
All Storage / Month	$0.0135 per GB`
* `S3 Glacier Deep Archive *** - For long-term data archiving that is accessed once or twice in a year and can be restored within 12 hours	
All Storage / Month	$0.0018 per GB`

So it 1,254.40$ per month for S3 Standard and 691.20$ per month for S3 Standard - Infrequent Access.