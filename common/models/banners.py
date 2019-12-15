from django.db import models
            

class Banners(models.Model):
    administrator_id = models.IntegerField()
    shop_id = models.IntegerField()
    board_type = models.IntegerField()
    prefecture_id = models.IntegerField()
    area_id = models.IntegerField()
    title = models.CharField(max_length=255)
    sub_title = models.CharField(max_length=255)
    alt = models.CharField(max_length=255)
    start_at = models.DateTimeField()
    end_at = models.DateTimeField()
    image_path = models.CharField(max_length=255)
    link = models.CharField(max_length=255)
    memo = models.CharField(max_length=255)
    priority = models.IntegerField()
    orderby = models.IntegerField()
    own_made_flg = models.CharField(max_length=1)
    main_flg = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'banners'
