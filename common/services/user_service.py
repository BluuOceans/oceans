
from common.models.users import Users


def get_user_by_id(user_id:int):
    return Users.objects.filter(pk=user_id).first()
