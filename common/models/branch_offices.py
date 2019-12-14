from django.db import models
            

class BranchOffices(models.Model):
    id = models.IntegerField()
    bank_id = models.IntegerField()
    name = models.CharField(max_length=255)
    name_kana = models.CharField(max_length=255)
    number = models.CharField(max_length=255)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'branch_offices'
