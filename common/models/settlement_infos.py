from django.db import models
            

class SettlementInfos(models.Model):
    bank_id = models.IntegerField()
    branch_office_id = models.IntegerField()
    account = models.CharField(max_length=255)
    host_name = models.CharField(max_length=255)
    user_id = models.IntegerField()
    shop_id = models.IntegerField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'settlement_infos'
