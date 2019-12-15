

class SqlToModels:
    def __init__(self, filepath, targetpath):
        tables = dict()

        with open(filepath, 'r') as f:
            data = f.read().splitlines()
            table_name = None
            deafult_text = """from django.db import models
            

"""
            text = None
            table_name = None

            for line in data:
                if line.startswith("CREATE"):
                    if text:
                        text = text + """                        
    class Meta:
        db_table = '{}'
""".format(table_name)
                        with open('{}/{}.py'.format(targetpath, table_name), 'w') as f:
                            f.write(text)
                    text = deafult_text
                    table_name = line.split(' ')[2].strip('`')
                    table_name_word = table_name.split('_')
                    class_name = ''
                    for word in table_name_word:
                        class_name += word.capitalize()
                    text = text + """class {}(models.Model):
    """.format(class_name)

                else:
                    if line.strip().startswith('`'):
                        word_list = line.strip().split(' ')
                        column_name = word_list[0].strip('`')
                        if column_name =='id':
                            continue
                        var = "{} = ".format(column_name)
                        if word_list[1].startswith('int') or word_list[1].startswith('bigint'):
                            var = var + """models.IntegerField()
    """
                        elif word_list[1].startswith('char'):
                            char_num = word_list[1].lstrip('char(').rstrip(')')
                            var = var + """models.CharField(max_length={})
    """.format(char_num)
                        elif word_list[1].startswith('varchar'):
                            char_num = word_list[1].lstrip('varchar(').rstrip(')')
                            var = var + """models.CharField(max_length={})
    """.format(char_num)
                        elif word_list[1].startswith('text'):
                            var = var + """models.TextField()
    """.format(char_num)
                        elif word_list[1].startswith('date'):
                            var = var + """models.DateTimeField()
    """.format(char_num)
                        text = text + var


SqlToModels("/Users/kojunho/PycharmProjects/oceans/db_schems/20191211_db_create.sql", "/Users/kojunho/PycharmProjects/oceans/common/models/")
