json.comment @comment.comment
json.id @comment.id
json.user_nickname @comment.user.nickname
json.user_id @comment.user.id
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.item_seller @seller_of_item