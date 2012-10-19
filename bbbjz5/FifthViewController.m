//
//  FifthViewController.m
//  bbbjz5
//
//  Created by Synapse Asesores Informaticos, S.L. on 15/10/12.
//  Copyright (c) 2012 Synapse Asesores Informaticos, S.L. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Asistentes";
    //inicializamos los arrays, reservando memoria e insertandole los datos.
    backendDev=[[NSArray alloc] initWithObjects:@"Alonso Isidoro",@"David Maria",@"Joaquín Engelmo", @"Carlos Mourullo", @"Francisco Javier", @"Luis Manuel",@"Raul Tierno",  nil];
    
    other=[[NSArray alloc] initWithObjects:@"Daniel Berenguer", @"Luis Miguel", @"Victor Pavón", @"Gotardo González", @"Manuel Bordallo", @"Pedro Alvarez",@"Victor Pavón", nil];
    
    appsDev=[[NSArray alloc] initWithObjects:@"Fernando J. Pinilla", @"Maria Dolores", @"Manuel India Miguel",  nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //dependiendo de la seccion, se devuelve el título de cada sección
    if (section ==0)
        return @"Backend Developers";
    else if (section ==1)
        return @"Otros";
    else if (section==2)
        return @"Apps Developers";
    else return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section ==0)
        return [backendDev count];
    else if (section ==1)
        return [other count];
    else if (section==2)
        return [appsDev count];
    else return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //dependiendo de la sección que sea, se devuelve la posición del array correspondiente
    if (indexPath.section ==0){
        cell.textLabel.text=[backendDev objectAtIndex:indexPath.row];
    } else if (indexPath.section ==1){
        cell.textLabel.text=[other objectAtIndex:indexPath.row];
    } else if (indexPath.section==2){
        cell.textLabel.text=[appsDev objectAtIndex:indexPath.row];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    //inicializamos la variable nombreDev dependiendo de la posición de cada array
    if (indexPath.section ==0){
        detailViewController.nombreDev = [backendDev objectAtIndex:indexPath.row];
    } else if (indexPath.section ==1){
        detailViewController.nombreDev = [other objectAtIndex:indexPath.row];
    } else if (indexPath.section==2){
        detailViewController.nombreDev = [appsDev objectAtIndex:indexPath.row];
    }

    //y lo lanzamos a la siguiente vista
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
