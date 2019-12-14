from django.db import models
            

class Reports(models.Model):
    id = models.IntegerField()
    user_id = models.IntegerField()
    target_user_id = models.IntegerField()
    shop_id = models.IntegerField()
    message_box_id = models.IntegerField()
    care_request_id = models.IntegerField()
    trade_id = models.IntegerField()
    comment_id = models.IntegerField()
    like_id = models.IntegerField()
    reason = models.TextField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'reports'
