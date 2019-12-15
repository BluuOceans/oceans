from django.db import models
            

class Settlements(models.Model):
    settlement_info_id = models.IntegerField()
    settlement_at = models.DateTimeField()
    memo = models.CharField(max_length=255)
    token = models.CharField(max_length=255)
    complete_flg = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'settlements'
