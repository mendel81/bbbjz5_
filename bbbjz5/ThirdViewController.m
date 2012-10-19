//
//  ThirdViewController.m
//  bbbjz5
//
//  Created by Synapse Asesores Informaticos, S.L. on 15/10/12.
//  Copyright (c) 2012 Synapse Asesores Informaticos, S.L. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

//http://search.twitter.com/search.json?q=%23bbbjz

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Tweets", @"Tweets");
        self.tabBarItem.image = [UIImage imageNamed:@"three"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    tweets = [[NSMutableArray alloc] init];

    [self fetchTweets];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //retorna alto de cada celda en pixels
    return 120;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //retorna el numero de celdas (el total del array tweets)
    return [tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *tweet = [tweets objectAtIndex:indexPath.row];
    NSString *text = [tweet objectForKey:@"text"];
    NSString *name = [tweet objectForKey:@"from_user"] ;

   // cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[tweet objectForKey:@"profile_image_url"]]]];
    
    //generamos una imagen estática mientras se carga asincronamente la imagen del perfil
    cell.imageView.image = [UIImage imageNamed:@"three"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        //conectamos para cargar de forma asincrona y sin que se nos congele la pantalla para traernos las imagenes de perfil de twitter
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[tweet objectForKey:@"profile_image_url"]]];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_sync(dispatch_get_main_queue(), ^{
            //una vez cargadas, las insertamos en la celda de la tabla
            cell.imageView.image = image;
        });
    });
    
    //insertamos el texto en las celdas y las configuramos
    cell.textLabel.text = text;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"by %@", name];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.font= [UIFont fontWithName:@"Helvetica" size:14];
    cell.detailTextLabel.font= [UIFont fontWithName:@"Helvetica" size:12];

    
    return cell;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


#pragma mark - metodos propios

//! Nos carga asincronamente los tweets con el hashtag #bbbjz en el array "tweets" y nos recarga el tableview
//! @param nil
//! @return nil
- (void)fetchTweets {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString: @"http://search.twitter.com/search.json?q=%23bbbjz"]];
        
        NSError* error;
        
        NSDictionary *tw = [[NSDictionary alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data
                                                                                                    options:kNilOptions
                                                                                                      error:&error]];
        
        NSLog( @"%@", tw);
        [tweets addObjectsFromArray:[tw objectForKey:@"results" ]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}


@end
