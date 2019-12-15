from django.db import models
            

class Boards(models.Model):
    board_type = models.IntegerField()
    user_id = models.IntegerField()
    administrator_id = models.IntegerField()
    title = models.CharField(max_length=255)
    sub_title = models.CharField(max_length=255)
    main_image_path = models.CharField(max_length=255)
    sub_image_path = models.CharField(max_length=255)
    youtube_link = models.TextField()
    upload_file_path = models.CharField(max_length=255)
    tags = models.CharField(max_length=255)
    content = models.TextField()
    priority = models.IntegerField()
    orderby = models.IntegerField()
    read_count = models.IntegerField()
    main_flg = models.CharField(max_length=1)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'boards'
