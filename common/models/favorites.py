from django.db import models
            

class Favorites(models.Model):
    user_id = models.IntegerField()
    shop_id = models.IntegerField()
    div = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'favorites'
