from django.db import models
            

class Grades(models.Model):
    id = models.IntegerField()
    div = models.CharField(max_length=1)
    name = models.CharField(max_length=255)
    name_kana = models.CharField(max_length=255)
    grade = models.IntegerField()
    explain = models.CharField(max_length=255)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'grades'
