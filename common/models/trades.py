from django.db import models
            

class Trades(models.Model):
    div = models.CharField(max_length=1)
    user_id = models.IntegerField()
    pet_category_id = models.IntegerField()
    pet_variety_id = models.IntegerField()
    title = models.CharField(max_length=255)
    sub_title = models.CharField(max_length=255)
    content = models.TextField()
    caution = models.TextField()
    phone_number = models.CharField(max_length=255)
    mobile_number = models.CharField(max_length=255)
    prefecture_id = models.IntegerField()
    area_id = models.IntegerField()
    address = models.CharField(max_length=255)
    pay_amount = models.IntegerField()
    read_count = models.IntegerField()
    main_flg = models.CharField(max_length=1)
    attention_flg = models.CharField(max_length=1)
    complete_flg = models.CharField(max_length=1)
    report_flg = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'trades'
