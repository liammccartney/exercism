import re


class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num

    def valid(self):
        try:
            card_num = [int(x) for x in re.sub(r"\s+", "", self.card_num)[::-1]]

        except ValueError:
            return False

        if len(card_num) <= 1:
            return False

        checksum = card_num[0]

        for idx, num in enumerate(card_num[1:]):
            if idx % 2 == 0:
                double = num * 2

                if double > 9:
                    double -= 9

                checksum += double
                continue

            checksum += num

        return checksum % 10 == 0
