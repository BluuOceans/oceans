from django.db import models
            

class Administrators(models.Model):
    grade_id = models.IntegerField()
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    name_kana = models.CharField(max_length=255)
    sex = models.CharField(max_length=1)
    date_of_birth = models.DateTimeField()
    image_path = models.CharField(max_length=255)
    explain = models.TextField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'administrators'
