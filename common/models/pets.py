from django.db import models
            

class Pets(models.Model):
    id = models.IntegerField()
    user_id = models.IntegerField()
    pet_category_id = models.IntegerField()
    pet_variety_id = models.IntegerField()
    name = models.CharField(max_length=255)
    sex = models.CharField(max_length=1)
    date_of_birth = models.DateTimeField()
    start_date = models.DateTimeField()
    character = models.TextField()
    about = models.TextField()
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
                            
    class Meta:
        db_table = 'pets'
