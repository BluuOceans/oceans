from django.db import models


class Users(models.Model):

    email = models.CharField(max_length=255)
    display_name = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    sex = models.CharField(max_length=1)
    date_of_birth = models.DateField()
    grade_id = models.IntegerField()
    prefecture_id = models.IntegerField()
    area_id = models.IntegerField()
    address = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    name_kana = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    image_path = models.CharField(max_length=255)
    about_me = models.TextField()
    settlement_id = models.IntegerField()
    evaluate_id = models.IntegerField()
    is_info_mail = models.CharField(max_length=1)
    is_mail_magazine = models.CharField(max_length=1)
    is_push_alert = models.CharField(max_length=1)
    is_restriction = models.CharField(max_length=1)
    is_mail_certificated = models.CharField(max_length=1)
    is_phone_certificated = models.CharField(max_length=1)
    mail_certificate_date = models.DateTimeField()
    phone_certificate_date = models.DateTimeField()
    recent_login_date = models.DateTimeField()
    recent_login_ip = models.CharField(max_length=255)
    recent_login_device = models.CharField(max_length=255)
    recent_login_os_version = models.CharField(max_length=255)
    del_flg = models.CharField(max_length=1)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()

    class Meta:
        db_table = 'users'
