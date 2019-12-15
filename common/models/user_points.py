from django.db import models
            

class UserPoints(models.Model):
    user_id = models.IntegerField()
    point_type = models.CharField(max_length=4)
    point_amount = models.IntegerField()
    end_at = models.DateTimeField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'user_points'
