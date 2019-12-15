from django.db import models
            

class Comments(models.Model):
    board_id = models.IntegerField()
    user_id = models.IntegerField()
    title = models.CharField(max_length=255)
    content = models.TextField()
    orderby = models.IntegerField()
    report_flg = models.CharField(max_length=1)
    attention_flg = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'comments'
