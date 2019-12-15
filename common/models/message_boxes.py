from django.db import models
            

class MessageBoxes(models.Model):
    send_user_id = models.IntegerField()
    receive_user_id = models.IntegerField()
    title = models.CharField(max_length=255)
    content = models.TextField()
    protect_flg = models.CharField(max_length=1)
    message_box_id = models.IntegerField()
    received_at = models.DateTimeField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'message_boxes'
