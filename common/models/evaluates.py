from django.db import models
            

class Evaluates(models.Model):
    id = models.IntegerField()
    user_id = models.IntegerField()
    rate = shop_id = models.IntegerField()
    target_user_id = models.IntegerField()
    memo = models.IntegerField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'evaluates'
