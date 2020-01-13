from django.template.response import TemplateResponse
from django.views.generic import View

class MapView(View):

    def get(self,reqeust):
        return TemplateResponse(reqeust,'sample/map.html')
