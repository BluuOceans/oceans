from django.template.response import TemplateResponse
from django.views.generic import View
from common.services import user_service


class SampleView(View):

    def get(self, request):
        user_id = request.GET.get('user_id')

        context = dict()

        if user_id:
            user = user_service.get_user_by_id(user_id)  # service을 이용해서 디비에서 유저정보를 취득
            msg = 'ユーザー情報が存在します（名前：{}）'.format(user['name']) if user else 'ユーザー情報が存在しません。'
        else:
            msg = 'sample/smaple?user_id={id}の形でアクセスしてみましょう'

        context.update({"msg": msg})
        return TemplateResponse(request, 'sample/sample.html', context)
