from django.db import models
            

class Notifications(models.Model):
    type = models.CharField(max_length=1)
    user_id = models.IntegerField()
    pet_id = models.IntegerField()
    action_date = models.DateTimeField()
    next_date = models.DateTimeField()
    alert_on_flg = models.CharField(max_length=1)
    repeat_flg = models.CharField(max_length=1)
    complete_flg = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'notifications'
