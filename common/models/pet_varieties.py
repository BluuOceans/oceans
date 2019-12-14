from django.db import models
            

class PetVarieties(models.Model):
    id = models.IntegerField()
    name = models.CharField(max_length=255)
    name_kana = models.CharField(max_length=255)
    explain = models.TextField()
    feature = models.TextField()
    caution = models.TextField()
    orderby = models.IntegerField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'pet_varieties'
