from random import shuffle

with open('messages10-07-2022 15-15.sql', 'r') as file_r:
    lines = file_r.readlines()
    users_id = [lines[i].split('(')[2].split(', ')[2] for i in range(19, 1019)]
    new_users_id = users_id.copy()
    with open('messages.sql', 'w') as file_w:
        shuffle(new_users_id)
        new_lines = lines.copy()
        for i in range(19, 1019):
            new_lines[i] = lines[i][:lines[i].rfind(users_id[i-19])] + new_users_id[i - 19] + ', ' + \
                           lines[i][lines[i].rfind(users_id[i-19]):].split(', ')[1] + ', ' + \
                           lines[i][lines[i].rfind(users_id[i-19]):].split(', ')[2]
        file_w.writelines(new_lines)
