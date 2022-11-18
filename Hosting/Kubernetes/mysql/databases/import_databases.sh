#mysql -uroot -e "create DATABASE sfj_dev";
mysqldump --column-statistics=0 -uroot -h"10.32.1.38" sfj_dev | mysql -uroot sfj_dev;