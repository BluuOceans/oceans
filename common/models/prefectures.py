from django.db import models
            

class Prefectures(models.Model):
    region_id = models.IntegerField()
    name = models.IntegerField()
    name_kana = models.IntegerField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'prefectures'
