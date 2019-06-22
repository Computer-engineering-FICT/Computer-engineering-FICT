import lab1.FB_SMO as fb
import lab1.RR_SMO as rr
import lab1.SF_SMO as sf


if __name__=="__main__":
    lamb1 = float(input('Input lambda = '))
    mu1 = float(input('Input mu = '))
    crit_time = float(input('Input critical time for RR and FB = '))

    print('====================== SF =========================')
    new_sf = sf.SF_SMO(mu1, lamb1)
    new_sf.start()

    try:
        print('====================== RR =========================')
        new_rr = rr.RR_SMO(mu1, lamb1, crit_time)
        new_rr.start()
    except:
        print('you loose')

    print('====================== FB =========================')
    new_fb = fb.FB_SMO(mu1, lamb1, crit_time)
    new_fb.start()
