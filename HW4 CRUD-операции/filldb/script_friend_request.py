from random import shuffle

with open('friend_request10-07-2022 15-16.sql', 'r') as file_r:
    lines = file_r.readlines()
    target_user_id = [lines[i].split('(')[2].split(', ')[1] for i in range(18, 518)]
    new_target_user_id = target_user_id.copy()
    with open('friend_request.sql', 'w') as file_w:
        shuffle(new_target_user_id)
        new_lines = lines.copy()
        for i in range(18, 518):
            new_lines[i] = lines[i].split(target_user_id[i-18])[0] + target_user_id[i-18] + ', ' + \
                           new_target_user_id[i-18] + lines[i].split(target_user_id[i-18])[2]
        file_w.writelines(new_lines)
